import 'package:json_annotation/json_annotation.dart';

part '_generated/kitty_fact_dto.g.dart';

@JsonSerializable()
class KittyFactDto {
  @JsonKey(name: "fact")
  final String fact;
  @JsonKey(name: "length")
  final int length;

  KittyFactDto({required this.fact, required this.length});

  factory KittyFactDto.fromJson(Map<String, dynamic> json) =>
      _$KittyFactDtoFromJson(json);

  Map<String, dynamic> toJson() => _$KittyFactDtoToJson(this);
}
