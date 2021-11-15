<label class="btn btn-secondary [{if $oSelection->isActive()}]active[{/if}] mb-2 mr-2">
    <input type="radio" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]"  value="[{$oSelection->getValue()}]" [{if $oSelection->isActive()}]checked[{/if}]> [{$oSelection->getName()}]
</label>
