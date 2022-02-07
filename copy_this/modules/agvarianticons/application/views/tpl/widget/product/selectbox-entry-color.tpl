<label class="btn btn-link [{if $oSelection->isActive()}]active[{/if}] [{if $oSelection->isDisabled()}]disabled[{/if}] mb-2 mr-2" style="background-color:[{$oSelectionList->getSelectionHexColor($oSelection->getName())}]; background-image: url([{$oSelectionList->getSelectionImagePath($oSelection)}])">
    <input type="radio" value="[{$oSelection->getValue()}]" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" [{if $oSelection->isActive()}]checked[{/if}] [{if $oSelection->isDisabled()}]disabled[{/if}] data-selection-name="[{$oSelection->getName()}]">
    <span class="badge variantlistcolor" style="background-color:[{$oSelectionList->getSelectionHexColor($oSelection->getName())}]">[{$oSelection->getName()}]</span>
</label>

