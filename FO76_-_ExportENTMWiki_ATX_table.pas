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
  entlString := '}}{{ATX table|row'+lineEnd;
etdiString := GetEditValue(ElementBySignature(d, 'ETDI')); 
etdiString := AnsiLowerCase(StringReplace(etdiString,'.dds','',[rfReplaceAll,rfIgnoreCase]));
  entlString := entlString + '|image  =[[File:'+etdiString+' l.webp|thumb|center|90x90px]]'+lineEnd;
  entlString := entlString + '|name   ='+GetEditValue(ElementBySignature(d,'FULL'))+lineEnd;
  entlString := entlString + '|desc   ='''''+GetEditValue(ElementBySignature(d,'DESC'))+''''''+lineEnd;
  entlString := entlString + '|atom   ={{atom|}}'+lineEnd;
  entlString := entlString + '|formid ={{ID|'+IntToHex(FormID(d),8)+'}}';

entlString := StringReplace(entlString,lineEnd+lineEnd+'Build this entrance to access your Shelter.  ','<br/><small>Build this entrance to access your Shelter.</small>',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'This item cannot be built inside of a Shelter. ','<br/><small>This item cannot be built inside of a Shelter.</small>',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'   ','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- APPAREL IS CRAFTABLE AT ARMOR WORKBENCHES. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- AVAILABLE IN C.A.M.P. MODE IN THE WALL DECORATIONS CATEGORY. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- C.A.M.P. ITEMS APPEAR WHILE IN C.A.M.P. MODE. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- Grants the Witch Cauldron Cooking Station and Decoration. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- FLAIRS ARE APPLIED AT ARMOR WORKBENCHES. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- HEADLAMP IS CRAFTABLE AT POWER ARMOR STATIONS. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- HEADLAMP IS CRAFTABLE AT POWER ARMOR STATIONS ONCE MOTHMAN PAINT IS APPLIED. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- SHELTER ENTRANCES CAN BE PLACED IN C.A.M.P. MODE. - ','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- SKIN IS CRAFTABLE AT ARMOR WORKBENCHES. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- SKIN IS CRAFTABLE AT POWER ARMOR STATIONS. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- SKIN IS CRAFTABLE AT TINKER WORKBENCHES. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- SKIN IS CRAFTABLE AT WEAPON WORKBENCHES. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- THIS ITEM APPEARS WHILE IN C.A.M.P. MODE UNDER THE RESOURCES CATEGORY. - ','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- THIS ITEM IS PURELY DECORATIVE.- ','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A HAIRSTYLE OPTION. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A HAIRSTYLE OPTION FOR ALL FEMALE CHARACTERS. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A HAIRSTYLE OPTION FOR ALL MALE CHARACTERS. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A HAIRSTYLE OPTION FOR FEMALES. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A HAIRSTYLE OPTION FOR MALES. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A HOLIDAY VARIANT OF THE SURVIVAL TENT. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A PLAYER ICON. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A PLAYER ICON FOR ALL CHARACTERS. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A PLAYER LOOT BAG SKIN FOR ALL CHARACTERS. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A PHOTOMODE FRAME. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A PHOTOMODE POSE. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A RAIDER VARIANT OF THE SURVIVAL TENT. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A RESPONDERS VARIANT OF THE SURVIVAL TENT. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A TATTOO OPTION. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS A VARIANT OF THE SURVIVAL TENT.-','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS AN EMOTE OPTION. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- UNLOCKS AN EXTRA LOADOUT FOR ALL CHARACTERS ON YOUR ACCOUNT. - ','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- WALLPAPER ITEMS APPEAR WHILE IN C.A.M.P. EDIT MODE. -   ','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- WEAPON IS CRAFTABLE AT WEAPON WORKBENCHES. -','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'- WEAPON IS CRAFTABLE AT WEAPON WORKBENCHES. CANNOT BE USED IN POWER ARMOR. - ','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'Flairs can be applied to most Backpacks.','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'Only T-51 skins are available in Nuclear Winter Mode.','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'This item replaces the appearance of your dropped Paper Bag.','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'This skin can be applied to both the Small and Standard Backpack as a mod.','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'This is a unique skin that completely alters the appearance of your Power Armor. It  can be equipped on the Excavator, Raider, T-45, T-51, T-60, T-65, Ultracite and X-01 Power Armors.','',[rfReplaceAll,rfIgnoreCase]);
entlString := StringReplace(entlString,lineEnd+lineEnd+'Includes a unique paint for all Power Armor.','',[rfReplaceAll,rfIgnoreCase]);
   
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
  FilterSignatures := 'ENTM';
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
  
  fname := ProgramPath +'_'+version+'_Entitlements.wikitext';
  sl.SaveToFile(fname);
  sl.Free;
  
  Result := 1;
end;

end.
