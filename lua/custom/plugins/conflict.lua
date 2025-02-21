return {
  'rhysd/conflict-marker.vim',
  config = function()
    vim.g.conflict_marker_highlight_group = ''
    vim.api.nvim_set_hl(0, 'ConflictMarkerOurs', { bg = '#2e5049' })
    vim.api.nvim_set_hl(0, 'ConflictMarkerTheirs', { bg = '#344f69' })
    vim.api.nvim_set_hl(0, 'ConflictMarkerBegin', { bg = '#cc6558' })
    vim.api.nvim_set_hl(0, 'ConflictMarkerEnd', { bg = '#cc6558' })
    vim.api.nvim_set_hl(0, 'ConflictMarkerCOmmonAncestorsHunk', { bg = '#765a81' })
  end,
}
