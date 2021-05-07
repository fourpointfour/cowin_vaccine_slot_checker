class Center {
  final centerId;
  final String name;
  final String address;
  final String stateName;
  final String districtName;
  final String blockName;
  final pincode;
  final DateTime from;
  final DateTime to;
  final String feeType;
  final availableCapacity;
  final fee;
  final minAgeLimit;
  final String vaccineName;
  final List<String> slots;

  Center({
    this.centerId,
    this.name,
    this.address,
    this.stateName,
    this.districtName,
    this.blockName,
    this.pincode,
    this.from,
    this.to,
    this.feeType,
    this.availableCapacity,
    this.fee,
    this.minAgeLimit,
    this.vaccineName,
    this.slots
  });
}