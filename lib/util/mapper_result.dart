abstract class MapperResult<Input, Output> {
  Output mapTo(Input? from);
}

extension MapperExtension<Input, Output> on MapperResult<Input, Output> {
  List<Output> toListMapper(List<Input?>? listData) {
    return listData?.map((item) => mapTo(item)).toList() ?? List.empty();
  }
}
