[{$smarty.block.parent}]
[{assign var="oSelectionLists" value=$edit->getSelections()}]
[{if $oSelectionLists}]
<tr>
    <td colspan="2" class="edittext">

        <h3>[{oxmultilang ident="ARTICLE_EXTEND_DISABLED_COMBINATIONS"}]</h3>

        [{assign var="sDisabledCombinations" value=$edit->oxarticles__agdisabledcombinations->rawValue}]
        [{assign var="aDisabledCombinations" value=$sDisabledCombinations|@json_decode}]

        <table width="100%">
            <thead>
                <tr style="background: #ddd">
                    <th colspan="2">Gewählt</th>
                    <th colspan="2">Ausgeschlossen</th>
                    <th></th>
                </tr>
                <tr>
                    <th>Auswahlliste</th>
                    <th>Wert</th>
                    <th>Auswahlliste</th>
                    <th>Wert</th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="combinationTableBody">
                [{foreach from=$aDisabledCombinations item=combination}]
                    <tr data-combination="[{$combination|@json_encode|escape}]">
                        <td>[{$combination->option}]</td>
                        <td>[{$combination->value}]</td>
                        <td>[{$combination->disabledOption}]</td>
                        <td>[{$combination->disabledValue}]</td>
                        <td><input type="button" class="removeCombinationButton" value="&times;"></input></td>
                    </tr>
                [{/foreach}]
                <tr id="newCombinationRow">
                    <td>
                        <select name="newCombinationOption">
                            [{foreach from=$oSelectionLists item="oSelectionList"}]
                            [{if !$oFirstSelectionList}][{assign var="oFirstSelectionList" value=$oSelectionList}][{/if}]
                            <option value="[{$oSelectionList->getLabel()}]">[{$oSelectionList->getLabel()}]</option>
                            [{/foreach}]
                        </select>
                    </td>
                    <td>
                        <select name="newCombinationValue">
                            [{foreach from=$oFirstSelectionList->getSelections() item=oSelectionValue}]
                            <option value="[{$oSelectionValue->getName()}]">[{$oSelectionValue->getName()}]</option>
                            [{/foreach}]
                        </select>
                    </td>
                    <td>
                        <select name="newCombinationDisabledOption">
                            [{foreach from=$oSelectionLists item="oSelectionList"}]
                            <option value="[{$oSelectionList->getLabel()}]">[{$oSelectionList->getLabel()}]</option>
                            [{/foreach}]
                        </select>
                    </td>
                    <td>
                        <select name="newCombinationDisabledValue">
                            [{foreach from=$oFirstSelectionList->getSelections() item=oSelectionValue}]
                            <option value="[{$oSelectionValue->getName()}]">[{$oSelectionValue->getName()}]</option>
                            [{/foreach}]
                        </select>
                    </td>
                    <td>
                        <input id="addCombinationButton" type="button" value="Hinzufügen"></input>
                    </td>
                </tr>
            </tbody>

            <tr>
                <td colspan="3"></td>
                <td></td>
            </tr>
        </table>
        [{capture assign=pageScript}]
            var selectionLists = [[{strip}]
                [{foreach from=$oSelectionLists item=oSelectionList name=selectionlists}]
                    {
                        "option": "[{$oSelectionList->getLabel()}]",
                        "values": [
                            [{foreach from=$oSelectionList->getSelections() item=oSelectionValue name=selectionvalues}]
                                "[{$oSelectionValue->getName()}]"[{if !$smarty.foreach.selectionvalues.last}],[{/if}]
                            [{/foreach}]
                        ]
                    }[{if !$smarty.foreach.selectionlists.last}],[{/if}]
                [{/foreach}]
    [{/strip}]];
            $(function(){
                $('#addCombinationButton').click(function(){
                    var newCombination = {
                        "option": $('select[name="newCombinationOption"]').val(),
                        "value": $('select[name="newCombinationValue"]').val(),
                        "disabledOption": $('select[name="newCombinationDisabledOption"]').val(),
                        "disabledValue": $('select[name="newCombinationDisabledValue"]').val()
                    };

                    var row = $('<tr/>');
                    row.data('combination', newCombination);
                    row.append($('<td/>').text(newCombination.option));
                    row.append($('<td/>').text(newCombination.value));
                    row.append($('<td/>').text(newCombination.disabledOption));
                    row.append($('<td/>').text(newCombination.disabledValue));
                    row.append($('<td/>').append($('<input type="button" class="removeCombinationButton" value="&times;"/>')));
                    $('#newCombinationRow').before(row);

                    updateDisabledCombinations();
                });

                function updateDisabledCombinations () {
                    var allCombinations = [];

                    $('#combinationTableBody > tr').each(function(){
                        if ($(this).data('combination')) {
                            allCombinations.push($(this).data('combination'));
                        }
                    });
                    $('#disabledCombinationInput').val(JSON.stringify(allCombinations, null, 2));
                }

                function fillSelectionValues (optionSelect, valueSelect) {
                    var option = $(optionSelect).val();
                    var list = selectionLists.find( function(list){
                        return list.option == option;
                    });
                    var options = list.values.map(function(value){
                        return $('<option/>').val(value).text(value);
                    });
                    $(valueSelect).empty();
                    $(valueSelect).append(options);
                }

                $('select[name="newCombinationOption"]').change(function(){
                    fillSelectionValues(this, $('select[name="newCombinationValue"]'));
                });

                $('select[name="newCombinationDisabledOption"]').change(function(){
                    fillSelectionValues(this, $('select[name="newCombinationDisabledValue"]'));
                });

                $('#combinationTableBody').on('click', '.removeCombinationButton', function(){
                    $(this).closest('tr').remove();
                    updateDisabledCombinations();
                });
            });
        [{/capture}]
        [{oxscript include="js/libs/jquery.min.js"}]
        [{oxscript add=$pageScript}]
        <textarea id="disabledCombinationInput" class="editinput" style="width:100%; min-height: 300px;" name="editval[oxarticles__agdisabledcombinations]"  [{$readonly}]>[{$edit->oxarticles__agdisabledcombinations->rawValue}]</textarea>
        [{oxinputhelp ident="HELP_ARTICLE_EXTEND_DISABLED_COMBINATIONS"}]
    </td>
</tr>
[{/if}]