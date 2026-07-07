class A:
    def a(self) -> None:
        print("Method from A")


class B(A):
    def b(self) -> None:
        print("Method from B")


class C(B):
    def c(self) -> None:
        print("Method from C")


class D(B):
    def d(self) -> None:
        print("Method from D")


class E(C, D):
    def e(self) -> None:
        print("Method from E")


def main() -> None:
    obj = E()

    obj.a()
    obj.b()
    obj.c()
    obj.d()
    obj.e()


if __name__ == "__main__":
    main()