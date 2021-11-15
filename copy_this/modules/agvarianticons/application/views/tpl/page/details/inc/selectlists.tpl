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
    [{/if}]
[{/if}]