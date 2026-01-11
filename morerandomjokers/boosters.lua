
SMODS.Booster {
    key = 'newboosterpack',
    loc_txt = {
        name = "New Booster Pack",
        text = {
            [1] = 'A {C:purple}custom{} booster pack with {C:blue}unique{} cards.'
        },
        group_name = "morerandom_boosters"
    },
    config = { extra = 3, choose = 1 },
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    group_key = "morerandom_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
            set = "Joker",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true
        }
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    