[{if $oViewConf->showSelectLists()}]
    [{assign var="oSelections" value=$oDetailsProduct->getSelections()}]
    [{if $oSelections}]
        <div class="selectorsBox variant-dropdown js-fnSubmit clear" id="productSelections">
            [{foreach from=$oSelections item=oList name=selections}]
                [{if $oList->isIconSelectlist()}]
                    [{include file="widget/product/selectbox-icon.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                [{else}]
                    [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                [{/if}]
            [{/foreach}]
        </div>
    [{/if}]
[{/if}]