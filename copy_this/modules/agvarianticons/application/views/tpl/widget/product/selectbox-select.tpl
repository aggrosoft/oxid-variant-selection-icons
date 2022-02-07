[{assign var="oSelections" value=$oSelectionList->getSelections()}]

[{if $oSelections}]
    <div class="form-group dropDown selectbox-select">
        [{if !$blHideLabel}]
        <p class="variant-label"><strong>[{$oSelectionList->getLabel()}][{oxmultilang ident="COLON"}]</strong></p>
        [{/if}]
        [{if $editable === false}]
        [{if $oActiveSelection}]
        <span class="float-left">[{$oActiveSelection->getName()}]</span>
        [{/if}]
        [{else}]
        <select class="custom-select" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]">
            [{if $blAllowEmptyValue}]<option>[{oxmultilang ident="CHOOSE_VARIANT"}]</option>[{/if}]
            [{foreach from=$oSelections item=oSelection}]
            <option value="[{$oSelection->getValue()}]" [{if $oSelection->isActive()}]selected[{/if}]>[{$oSelection->getName()}]</option>
            [{/foreach}]
        </select>
        [{/if}]
    </div>
[{/if}]