//In dart, functions are objects, just like Strings and numbers are objects.
//A Type-Def or function-type alias, gives a function type a name that you can use when declating fields and RETURN TYPES;
class SortedCollection {
  Function compare;

  SortedCollection(int f(Object a, Object b)) {
    compare = f;
  }
}

//Initial, broken implementation.
int sort(Object a, Object b) => 0;

/*
* Type information is lost when assigning `f` to `compare`. 
* The type of `f` is '(Object, Object) -> int' (where -> means returns),
* yet the type of `compare` is 'function'.
* 
* If we change the code to use explicit names and retain type information, bot developers and tools can use that information.
* */
typedef Compare = int Function(Object a, Object b);

/*
* Because typedefs are simply aliases, they offer a way to check the type of any fuction
* */
typedef Compare2<T> = int Function(T a, T b);

int sort2(int a, int b) => a - b;

class SortedCollection2 {
  Compare compare;

  SortedCollection2(this.compare);
}

void main() {
  SortedCollection coll = SortedCollection(sort);

  //All we know is that compare is a function,
  //but what type of function?
  assert(coll.compare is Function);

  SortedCollection2 coll2 = SortedCollection2(sort);
  assert(coll2.compare is Function);
  assert(coll2.compare is Compare);
  assert(coll.compare is Compare);
  assert(sort is Compare2<int>);
  assert(coll2.compare is Compare2<int>);
}
