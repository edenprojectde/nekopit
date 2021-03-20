package util;

import haxe.exceptions.NotImplementedException;

class Routing<R : IRoutingMatchable> {
    private var routes: Map<String, Either<R, Routing<R>>>;
    public function new() {
        routes = new Map<String, Either<R, Routing<R>>>();
    }

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

    public function registerSome(route: String, ?result: R, ?router: Routing<R>) {
        if(result!=null) {
            var either = new Either();
            either.setRight(router);
            routes.set(route,either);
        } else {
            var either = new Either();
            either.setLeft(result);
            routes.set(route,either);
        }
    }

    public function matchRoute(find: String) : Null<R> {
        for (key => value in routes) {
            if(value.isLeft() && value.LeftValue.match(find)) {
                return value.LeftValue;
            }
            if(key == find) { 
                if(value.isRight()) {
                    return value.RightValue.matchRoute(find);
                }
            }
        }
        return null;
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

interface IRoutingMatchable {
    public function match(pathRequested: String) : Bool;
}