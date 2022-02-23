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


def geodesic(t, y, a):
    return [y[1], -y[0] + 3 / 2 * a * y[0] ** 2]


def holein(t, y, a):
    return 1 / a - y[0]


def away(t, y, a):
    return 1 / a - 15 * y[0]


def kyori(t, y, a):
    return 1 / a - 5 * y[0]


def main():
    # Solar mass = 1
    mass = 1
    # rs = 1
    r0 = 5
    # arc degree
    psi = 160

    # step, related image size
    H = 4320
    dfai = np.pi / H

    rs, r_init = set_value(mass, r0)
    u0, v0 = set_params(r_init, psi)

    t_span = [0, 4 * np.pi]
    y0 = [u0, v0]

    sol = solve_ivp(
        geodesic,
        t_span,
        y0,
        method="RK45",
        args=(rs,),
        events=(holein, away),
        dense_output=True,
    )

    # print(sol.t)
    # print(sol.y)
    # print(sol.t_events)
    # print(sol.y_events)
    t0 = sol.t_events
    # print(t0[0].size)

    # 距離到達
    if t0[0].size == 0:
        td = t0[1][0]
        if td - dfai > dfai:
            z = sol.sol(td)
            r = 1 / z.T
            # print(r)
            t1 = np.linspace(0, td - dfai, 10)
            z1 = sol.sol(t1)
            # print(sol.sol(td - dfai))
            r1 = 1 / z1.T
        else:
            td = 0
            z = sol.sol(td)
            r = 1 / z.T
            # print(td)
            # print(r)
            t1 = np.linspace(0, td, 10)
            r1 = np.linspace(r, 15 * rs, 10)  # 到達半径
    # 捕獲
    elif t0[1].size == 0:
        td = t0[0][0]
        if td - dfai > dfai:
            z = sol.sol(td)
            r = 1 / z.T
            # print(td)
            # print(r)
            t1 = np.linspace(0, td - dfai, 10)
            z1 = sol.sol(t1)
            # print(sol.sol(td - dfai))
            r1 = 1 / z1.T
        else:
            td = 0
            z = sol.sol(td)
            r = 1 / z.T
            # print(td)
            # print(r)
            t1 = np.linspace(0, td, 10)
            r1 = np.linspace(r, rs, 10)
    # 円軌道
    else:
        td = t0[1][0]
        z = sol.sol(td)
        r = 1 / z.T
        # print(td)
        # print(r)
        t1 = np.linspace(0, td, 10)
        z1 = sol.sol(t1)
        # print(sol.sol(td))
        r1 = 1 / z1.T

    # print(t1)
    # print(r1 / rs)

    # plt.plot(t1, 1/z1.T, marker=".")
    # plt.plot(t, 1/z.T, marker="o")
    ax = plt.subplot(111, projection="polar")
    # plt.setp(ax, rorigin=0, rmin=rs, rmax=3*rs)
    # ax.plot(t, r, marker="o")
    ax.plot(t1, r1[:, 0] / rs, marker=".", label="light_ray")

    radious = np.ones(360)
    circle = np.linspace(0, 2 * np.pi, 360)
    ax.fill(circle, radious.T, color="k")
    # plt.xlabel('fai')
    # plt.legend(['u', 'v'], shadow=True)
    # plt.title('light_ray')
    plt.show()


if __name__ == "__main__":
    main()
