<label class="btn btn-link [{if $oSelection->isActive()}]active[{/if}] mb-2 mr-2" style="background-color:[{$oSelectionList->getSelectionHexColor($oSelection->getName())}]">
    <input type="radio" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" [{if $oSelection->isActive()}]checked[{/if}]>
    <span class="badge variantlistcolor" style="background-color:[{$oSelectionList->getSelectionHexColor($oSelection->getName())}]">[{$oSelection->getName()}]</span>
</label>

