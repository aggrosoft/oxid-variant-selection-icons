<label class="btn btn-link [{if $oSelection->isActive()}]active[{/if}] mb-2 mr-2">
    <input type="radio" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" [{if $oSelection->isActive()}]checked[{/if}]>
    <img src="[{$oSelection->getIcon()}]" alt="[{$oSelection->getName()}]" title="[{$oSelection->getName()}]" class="img-fluid variantlisticon" />
</label>