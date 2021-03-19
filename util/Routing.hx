package util;

import haxe.exceptions.NotImplementedException;

class Routing<R> {
    private var routes: Map<String, Either<R, Routing<R>>>;
    public function new() {}

    public function registerRoute(route: String, result: R) {
        var either = new Either();
        either.setLeft(result);
        routes.set(route,either);
    }

    public function registerRouter(route: String, router: Routing<R>) {
        var either = new Either();
        either.setRight(router);
        routes.set(route,either);
    }

    public function matchRoute(find: String) : R {
        for (key => value in routes) {
            if(key == find) { 
                if(value.isRight()) {
                    return value.RightValue.matchRoute(find);
                } else {
                    return value.LeftValue;
                }
            }
        }
        throw NotImplementedException;
    }
}

class Either<Left,Right> {
    public function new() {}
    public function isLeft() {
        return _isLeft;
    }
    public function isRight() {
        return _isRight;
    }
    public function setLeft(obj: Left) {
        LeftValue = obj;
        _isLeft = true;
    }
    public function setRight(obj:Right) {
        RightValue = obj;
        _isRight = true;
    }
    public var LeftValue: Null<Left>;
    public var RightValue: Null<Right>;
    private var _isLeft = false;
    private var _isRight = false;
}

