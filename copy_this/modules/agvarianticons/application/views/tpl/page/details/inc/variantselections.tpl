[{if $aVariantSelections && $aVariantSelections.selections}]
    [{assign var="blCanBuy" value=$aVariantSelections.blPerfectFit}]
    [{if !$blHasActiveSelections}]
        [{if !$blCanBuy && !$oDetailsProduct->isParentNotBuyable()}]
            [{assign var="blCanBuy" value=true}]
        [{/if}]
    [{/if}]
    <div id="variants" class="selectorsBox variant-dropdown js-fnSubmit">
        [{assign var="blHasActiveSelections" value=false}]
        [{foreach from=$aVariantSelections.selections item=oList key=iKey}]
            [{if $oList->getActiveSelection()}]
                [{assign var="blHasActiveSelections" value=true}]
            [{/if}]
            [{assign var=sDisplayType value=$oList->getVariantIconDisplayType()}]
            [{assign var=sDisplayTemplate value="widget/product/selectbox-"|cat:$sDisplayType|cat:'.tpl'}]
            [{if $sDisplayType }]
                [{include file=$sDisplayTemplate oSelectionList=$oList iKey=$iKey blInDetails=true sDisplayType=$sDisplayType blAllowEmptyValue=true}]
            [{else}]
                [{include file="widget/product/selectbox.tpl" oSelectionList=$oList iKey=$iKey blInDetails=true}]
            [{/if}]

        [{/foreach}]

        [{oxscript include=$oViewConf->getModuleUrl('agvarianticons','out/js/variantselections.js')}]

    </div>
[{/if}]