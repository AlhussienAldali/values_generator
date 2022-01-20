abstract class BaseRepository<T> {
  getFromLocalStorage();

  saveToLocalStorage(T value);

  removeFromLocalStorage(T value);

  getApiRequest();
}
