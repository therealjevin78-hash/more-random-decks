
SMODS.Edition {
    key = 'newedition',
    shader = 'foil',
    prefix_config = {
        -- This allows using the vanilla shader
        -- Not needed when using your own
        shader = false
    },
    loc_txt = {
        name = 'New Edition',
        label = 'New Edition',
        text = {
            [1] = 'A {C:blue}custom{} edition with {C:red}unique{} effects.'
        }
    },
    unlocked = true,
    discovered = true,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    
}