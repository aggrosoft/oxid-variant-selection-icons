[{$smarty.block.parent}]
<tr>
    <td class="edittext" width="100">
        [{oxmultilang ident="SELECTLIST_DISPLAYTYPE"}]
    </td>
    <td class="edittext">
        <input [{$readonly}] type="text" class="editinput" size="25" maxlength="[{$edit->oxselectlist__agdisplaytype->fldmax_length}]" name="editval[oxselectlist__agdisplaytype]" value="[{$edit->oxselectlist__agdisplaytype->value}]" style="width: 150px;">
        [{oxinputhelp ident="HELP_SELECTLIST_DISPLAYTYPE"}]
    </td>
    <td>&nbsp;</td>
</tr>