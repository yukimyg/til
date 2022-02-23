import numpy as np
from scipy.integrate import solve_ivp
from matplotlib import pyplot as plt


def set_value(mass, r0):
    rs = 3 * mass
    r_init = r0 * rs

    return rs, r_init


def set_params(r_init, psi):
    u0 = 1 / r_init
    v0 = u0 / np.tan(np.pi * (1 - psi / 180))
    return u0, v0


def geodesic(t, y, a, b):
    return [y[1], -y[0] + 3 / 2 * a * y[0] ** 2]


def holein(t, y, a, b):
    return 1 / a - y[0]


def away(t, y, a, b):
    return 1 / a - b * y[0]


def kyori(t, y, a, b):
    return 1 / a - 5 * y[0]


def orbit(sol, dfai, rs, split):
    t_events = sol.t_events
    # go away
    if (t_events[0].size == 0) & (t_events[1].size != 0):
        fai_event = t_events[1][0]
        if fai_event - dfai > dfai:
            u_event = sol.sol(fai_event)
            r_event = 1 / u_event
            fai_graph = np.linspace(0, fai_event - dfai, split)
            u_graph = sol.sol(fai_graph)
            r_graph = 1 / u_graph.T
        else:
            fai_event = 0
            u_event = sol.sol(fai_event)
            r_event = 1 / u_event.T
            fai_graph = np.linspace(0, fai_event, split)
            r_graph = np.linspace(r_event, r_event, split)  # seted finite value
    # holein
    elif (t_events[0].size != 0) & (t_events[1].size == 0):
        fai_event = t_events[0][0]
        if fai_event - dfai > dfai:
            u_event = sol.sol(fai_event)
            r_event = 1 / u_event.T
            fai_graph = np.linspace(0, fai_event - dfai, split)
            u_graph = sol.sol(fai_graph)
            r_graph = 1 / u_graph.T
        else:
            fai_event = 0
            u_event = sol.sol(fai_event)
            r_event = 1 / u_event.T
            fai_graph = np.linspace(0, fai_event, split)
            r_graph = np.linspace(r_event, rs, split)
    # circular orbit
    else:
        fai_event = t_events[1][0]
        u_event = sol.sol(fai_event)
        r_event = 1 / u_event.T
        fai_graph = np.linspace(0, fai_event, split)
        u_graph = sol.sol(fai_graph)
        r_graph = 1 / u_graph.T
    return fai_graph, r_graph


def graph_plot(ax, sol, rs, fai_graph, r_graph, line_width):
    ax.axis("off")
    ax.plot(
        fai_graph,
        r_graph[:, 0] / rs,
        marker="",
        label="light_ray",
        color="white",
        lw=line_width,
    )
    # ax.plot(sol.t, 1 / sol.y[0] / rs, marker="o", ls="")


def main():
    # Solar mass = 1
    mass = 1
    # rs = 1
    r0 = 3
    # step for ivp, related image size
    H = 4320
    # arc degree
    psi_list = np.linspace(128, 129.5, 100)
    psi_list = psi_list[psi_list != 180]
    # limit of distance for graph
    limit = 5
    # split for array for graph
    split = 100
    # line width of graph
    lw = 0.25

    dfai = np.pi / H

    rs, r_init = set_value(mass, r0)

    ax = plt.subplot(111, projection="polar")
    for psi in psi_list:
        u0, v0 = set_params(r_init, psi)

        t_span = [0, 4 * np.pi]
        y0 = [u0, v0]

        holein.terminal = True
        away.terminal = True

        sol = solve_ivp(
            geodesic,
            t_span,
            y0,
            method="RK45",
            args=(rs, limit),
            events=(holein, away),
            dense_output=True,
        )

        fai_graph, r_graph = orbit(sol, dfai, rs, split)

        graph_plot(ax, sol, rs, fai_graph, r_graph, lw)

    radious_back = np.full(360, limit)
    circle = np.linspace(0, 2 * np.pi, 360)
    ax.fill(circle, radious_back.T, color="grey")
    radious = np.ones(360)
    ax.fill(circle, radious.T, color="k")

    plt.title("light ray")
    plt.show()


if __name__ == "__main__":
    main()
