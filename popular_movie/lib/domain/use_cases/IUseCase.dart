abstract class IUseCase<Params, Result> {
  Future<Result> execute(Params params);
}
