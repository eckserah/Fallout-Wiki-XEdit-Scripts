{
  Apply custom scripted filter for FO76 dialogue lines; generates Wiki Table
}
unit ApplyCustomScriptedFilter;
var
  sl: TStringList;
function Filter(d: IInterface): Boolean;
var entlString, lineEnd, etdiString: String;
begin
  Result := False;
  lineEnd := #13#10;
  entlString := '}}'+lineEnd;
  entlString :='{{Dialogue table FO76|row'+lineEnd;
etdiString := GetEditValue(ElementBySignature(d,'INFO')); 
  entlString := entlString + '|actor   ='+GetEditValue(ElementBySignature(d,'ANAM'))+lineEnd;
  entlString := entlString + '|formid  ={{ID|'+IntToHex(FormID(d),8)+'}}'+lineEnd;
  entlString := entlString + '|topic   ={{ID|'+IntToHex(GRUP(d),8)+'}}'+lineEnd;
  entlString := entlString + '|gnam    ='+GetEditValue(ElementBySignature(d,'GNAM'))+lineEnd;
  entlString := entlString + '|line00  ='+GetEditValue(ElementByPath(d,'Responses/Response #0/TRDA/Response number'))+lineEnd;
  entlString := entlString + '|emote00 ='+GetEditValue(ElementByPath(d,'Responses/Response #0/TRDA/Emotion'))+lineEnd;
  entlString := entlString + '|text00  ='+GetEditValue(ElementByPath(d,'Responses/Response #0/NAM1'))+lineEnd;
  entlString := entlString + '|note00  ='+GetEditValue(ElementByPath(d,'Responses/Response #0/NAM2'));
   
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
  FilterSignatures := 'INFO';
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
  
  fname := ProgramPath +'_'+version+'_DialogueTables.wikitext';
  sl.SaveToFile(fname);
  sl.Free;
  
  Result := 1;
end;

end.
