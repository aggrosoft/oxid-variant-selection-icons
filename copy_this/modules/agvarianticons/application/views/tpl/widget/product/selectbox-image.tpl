[{assign var="oSelections" value=$oSelectionList->getSelections()}]

[{if $oSelections}]
    <div class="form-group dropDown selectbox-image">
        [{if !$blHideLabel}]
        <p class="variant-label"><strong>[{$oSelectionList->getLabel()}][{oxmultilang ident="COLON"}]</strong></p>
        [{/if}]
        [{if $editable === false}]
            [{if $oActiveSelection}]
            <span class="float-left">[{$oActiveSelection->getName()}]</span>
            [{/if}]
        [{else}]
        <div class="d-flex w-100 btn-group-toggle flex-wrap" data-toggle="buttons">
            [{foreach from=$oSelections item=oSelection}]
                [{include file="widget/product/selectbox-entry-image.tpl"}]
            [{/foreach}]
        </div>
        [{/if}]
    </div>
[{/if}]