[{assign var="oSelections" value=$oSelectionList->getSelections()}]
[{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
[{if $oSelections}]
    <div class="form-group dropDown selectbox-radio">
        [{if !$blHideLabel}]
        <p class="variant-label"><strong>[{$oSelectionList->getLabel()}][{oxmultilang ident="COLON"}]</strong></p>
        [{/if}]
        [{if $editable === false}]
            [{if $oActiveSelection}]
            <span class="float-left">[{$oActiveSelection->getName()}]</span>
            [{/if}]
        [{else}]
        <ul class="list-unstyled">
            [{foreach from=$oSelections item=oSelection}]
                [{include file="widget/product/selectbox-entry-radio.tpl"}]
            [{/foreach}]
        </ul>
        [{/if}]
    </div>
[{/if}]