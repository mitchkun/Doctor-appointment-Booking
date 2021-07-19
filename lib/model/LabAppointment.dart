class LabAppointment {
  String request_OID;
  String systemBranch_str;
  String appointDate_dat;
  String appointTime_tm;
  String clientLastname_str;
  String clientFirstname_str;
  String postedBy_GUID;

  LabAppointment(
      {this.request_OID,
      this.systemBranch_str,
      this.appointDate_dat,
      this.appointTime_tm,
      this.clientLastname_str,
      this.clientFirstname_str,
      this.postedBy_GUID});

  LabAppointment.map(dynamic obj) {
    this.request_OID = obj["requestOID"];
    this.systemBranch_str = obj["systemBranch_str"];
    this.appointDate_dat = obj["appointDate_dat"];
    this.appointTime_tm = obj["appointTime_tm"];
    this.clientLastname_str = obj["clientLastname_str"];
    this.clientFirstname_str = obj["clientFirstname_str"];
    this.postedBy_GUID = obj["postedBy_GUID"];
  }

  String get requestOID => request_OID;

  String get systemBranch => systemBranch_str;

  String get appointDate => appointDate_dat;

  String get appointTime => appointTime_tm;

  String get clientLastname => clientLastname_str;

  String get clientFirstname => clientFirstname_str;

  String get postedBy => postedBy_GUID;

  factory LabAppointment.fromJson(Map<String, dynamic> json) {
    return LabAppointment(
        request_OID: json['requestOID'] as String,
        systemBranch_str: json['systemBranch_str'] as String,
        appointDate_dat: json['appointDate_dat'] as String,
        appointTime_tm: json['appointTime_tm'] as String,
        clientLastname_str: json['clientLastname_str'] as String,
        clientFirstname_str: json['clientFirstname_str'] as String,
        postedBy_GUID: json['postedBy_GUID'] as String
        //thumbnailUrl: json['thumbnailUrl'] as String,
        );
  }
}
