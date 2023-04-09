service GuidanceService {
 
  entity Steps {
    key ID : UUID;
    step  : Integer;
    command : String;
    parameters  : String;
  }
}
