{
  Apply custom scripted filter for LVLN with Unknown 8
}
unit ApplyCustomScriptedFilter;

function Filter(d: IInterface): Boolean;
var val, Edid: String;
begin
  Result := False;
  if Not ElementExists(d,'FLTV') then Exit;
  val := GetEditValue(ElementBySignature(d,'FLTV'));
  Edid := EditorID(d);
AddMessage('-->{{#vardefine: '+Edid+'|'+val+'}}<!--'+IntToHex(FormID(d),8));
  Result := True;
end;

function Initialize: Integer;
begin
  FilterConflictAll := False;
  FilterConflictThis := False;
  FilterByInjectStatus := False;
  FilterInjectStatus := False;
  FilterByNotReachableStatus := False;
  FilterNotReachableStatus := False;
  FilterByReferencesInjectedStatus := False;
  FilterReferencesInjectedStatus := False;
  FilterByEditorID := False;
  FilterEditorID := '';
  FilterByName := False;
  FilterName := '';
  FilterByBaseEditorID := False;
  FilterBaseEditorID := '';
  FilterByBaseName := False;
  FilterBaseName := '';
  FilterScaledActors := False;
  FilterByPersistent := False;
  FilterPersistent := False;
  FilterUnnecessaryPersistent := False;
  FilterMasterIsTemporary := False;
  FilterIsMaster := False;
  FilterPersistentPosChanged := False;
  FilterDeleted := False;
  FilterByVWD := False;
  FilterVWD := False;
  FilterByHasVWDMesh := False;
  FilterHasVWDMesh := False;
  FilterBySignature := True;
  FilterSignatures := 'GLOB';
  FilterByBaseSignature := False;
  FilterBaseSignatures := '';
  FlattenBlocks := True;
  FlattenCellChilds := False;
  AssignPersWrldChild := False;
  InheritConflictByParent := True; // color conflicts
  FilterScripted := True; // use custom Filter() function
  ApplyFilter;
  Result := 1;
end;

end.
