abstract class RemoteDataSource<T> {
  Future<bool> add(T item);
  Future<bool> remove(T item);
  Future<bool> update(T item);
  Future<List<T>> fetch();
}