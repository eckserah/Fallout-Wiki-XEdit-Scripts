{
  Apply custom scripted filter for Atomic Shop Entitlements; generates Wiki Table
}
unit ApplyCustomScriptedFilter;
var
  sl: TStringList;
function Filter(d: IInterface): Boolean;
var entlString, lineEnd, etdiString: String;
begin
  Result := False;
  lineEnd := #13#10;
  entlString := '|-'+lineEnd;
etdiString := GetEditValue(ElementBySignature(d,'GMST')); 
  entlString := entlString + '|'+GetEditValue(ElementBySignature(d,'EDID'))+lineEnd;
  entlString := entlString + '| '+GetEditValue(ElementByIndex(ElementBySignature(d, 'DATA'), 0))+lineEnd;
  entlString := entlString + '|{{ID|'+IntToHex(FormID(d),8)+'}}';
   
  AddMessage(entlString);
  sl.Add(entlString);
  Result := True;
end;

function Initialize: Integer;
var
	fname, version: string;
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
  FilterSignatures := 'GMST';
  FilterByBaseSignature := False;
  FilterBaseSignatures := '';
  FlattenBlocks := True;
  FlattenCellChilds := False;
  AssignPersWrldChild := False;
  InheritConflictByParent := True; // color conflicts
  FilterScripted := True; // use custom Filter() function
  sl := TStringList.Create;
  version := '1.5.0.19';

  ApplyFilter;
  
  fname := ProgramPath +'_'+version+'_GameSettings.wikitext';
  sl.SaveToFile(fname);
  sl.Free;
  
  Result := 1;
end;

end.
