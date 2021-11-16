[{if $oViewConf->showSelectLists()}]
    [{assign var="oSelections" value=$oDetailsProduct->getSelections()}]
    [{if $oSelections}]
        <div class="selectorsBox variant-dropdown js-fnSubmit clear" id="productSelections">
            [{foreach from=$oSelections item=oList name=selections}]
                [{assign var=sDisplayTemplate value=$oList->getVariantIconDisplayTemplate()}]
                [{if $sDisplayTemplate}]
                    [{include file=$sDisplayTemplate oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                [{else}]
                    [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                [{/if}]
            [{/foreach}]
        </div>
        [{if $oDetailsProduct->oxarticles__agdisabledcombinations->rawValue}]
        [{capture assign=disableCombinationsScript}]
            $(function(){

                var disabledCombinations = [{$oDetailsProduct->oxarticles__agdisabledcombinations->rawValue}];

                function getFormGroupByLabel (label) {
                    var group = undefined;
                    $('#productSelections > .form-group').each(function(){
                        var option = $(this).find('.variant-label > strong').text().replace(':','');
                        if (option === label) {
                            group = $(this);
                            return false;
                        }
                    });
                    return group;
                }

                function getFormGroupSelection (group) {
                    var option = $(group).find('.variant-label > strong').text().replace(':','');
                    if ($(group).find('select').length) {
                        var selected = $(group).find('select > option:selected');
                        var value = $(selected).text().replace(/\+[\d,]* €/,'').trim();
                        return {option: option, value: value};
                    } else {
                        var selected = $(group).find('input:checked');
                        if ($(group).find('.btn-group-toggle').length) {
                            var value = $(selected).parent().text().replace(/\+[\d,]* €/,'').trim();
                        } else {
                            var value = $(selected).parent().find('label').text().replace(/\+[\d,]* €/,'').trim();
                        }

                        return {option: option, value: value};
                    }
                }

                function disableCombinations (relatedInput) {
                    var currentDisabledCombinations = [];
                    var resettedValues = [];

                    $('#productSelections > .form-group input, #productSelections > .form-group select option').prop("disabled", false);
                    $('#productSelections > .form-group .btn-group-toggle .btn').removeClass('disabled');
                    $('#productSelections > .form-group').each(function(){
                        var selection = getFormGroupSelection($(this));
                        var willDisable = disabledCombinations.filter(function(combination){
                            return selection.option.indexOf(combination.option) === 0 && selection.value.indexOf(combination.value) === 0
                        })
                        currentDisabledCombinations = currentDisabledCombinations.concat(willDisable);
                    });
                    currentDisabledCombinations.forEach(function(disabled){
                        var group = getFormGroupByLabel(disabled.disabledOption);
                        if ($(group).find('select').length) {
                            $(group).find('option').each(function(){
                                var value = $(this).text().replace(/\+[\d,]* €/,'').trim();
                                if (value.indexOf(disabled.disabledValue) === 0) {
                                    if ( $(this).is(':selected') ) {
                                        $(this).parent().val($(this).parent().find('option:not([disabled]):first').val());
                                        resettedValues.push(disabled);
                                    }
                                    $(this).prop("disabled", true);
                                }
                            })
                        } else {
                            $(group).find('input').each(function(){
                                if ($(group).find('.btn-group-toggle').length) {
                                    var value = $(this).parent().text().replace(/\+[\d,]* €/,'').trim();
                                } else {
                                    var value = $(this).parent().find('label').text().replace(/\+[\d,]* €/,'').trim();
                                }
                                if (value.indexOf(disabled.disabledValue) === 0) {
                                    if ( $(this).is(':checked') ) {
                                        $(group).find(':radio:not([disabled]):first').prop("checked", true);
                                        resettedValues.push(disabled);
                                    }
                                    if ($(group).find('.btn-group-toggle').length) {
                                        $(this).parent().addClass('disabled');
                                    }
                                    $(this).prop("disabled", true);
                                }
                            })
                        }
                    })

                    if (relatedInput && resettedValues.length) {
                        var lis = resettedValues.map(function(val){
                            return '<li>'+val.disabledOption+': '+val.disabledValue+'</li>';
                        })
                        relatedInput.popover({
                            html: true,
                            content: 'Ihre Auswahl erlaubt folgendes nicht, es wurde zurück gesetzt:<br><ul style="margin-top: 10px; padding-left: 15px;">'+lis+'</ul>',
                            trigger: 'manual',
                            placement: 'left'
                        });
                        relatedInput.popover('show');
                        setTimeout(function(){ $(relatedInput).popover('dispose'); }, 5000);
                        // we must resolve until no changes are made anymore, currently we do not show messages for nested changes
                        disableCombinations();
                    }
                }

                $('#productSelections > .form-group :input').change(function(){
                    $('#productSelections > .form-group :input').popover('dispose');
                    disableCombinations($(this));
                })

                disableCombinations();

            })
        [{/capture}]
        [{oxscript add=$disableCombinationsScript}]
        [{/if}]
    [{/if}]
[{/if}]