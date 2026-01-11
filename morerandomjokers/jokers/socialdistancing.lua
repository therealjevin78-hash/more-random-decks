
SMODS.Joker{ --Social Distancing
    key = "socialdistancing",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Social Distancing',
        ['text'] = {
            [1] = 'This joker distances itself from other',
            [2] = 'jokers to its left and right.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["morerandom_mycustom_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                func = function()
                    local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_joker = nil
                    if my_pos and my_pos > 1 then
                        local joker = G.jokers.cards[my_pos - 1]
                        if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                            target_joker = joker
                        end
                    end
                    
                    if target_joker then
                        target_joker.getting_sliced = true
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                return true
                            end
                        }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                    end
                    return true
                end,
                extra = {
                    func = function()
                        
                        local created_joker = false
                        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                            created_joker = true
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_morerandom_blank' })
                                    if joker_card then
                                        
                                        
                                    end
                                    G.GAME.joker_buffer = 0
                                    return true
                                end
                            }))
                        end
                        if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                        end
                        return true
                    end,
                    colour = G.C.BLUE,
                    extra = {
                        func = function()
                            local my_pos = nil
                            for i = 1, #G.jokers.cards do
                                if G.jokers.cards[i] == card then
                                    my_pos = i
                                    break
                                end
                            end
                            local target_joker = nil
                            if my_pos and my_pos < #G.jokers.cards then
                                local joker = G.jokers.cards[my_pos + 1]
                                if not SMODS.is_eternal(joker) and not joker.getting_sliced then
                                    target_joker = joker
                                end
                            end
                            
                            if target_joker then
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                            end
                            return true
                        end,
                        colour = G.C.RED,
                        extra = {
                            func = function()
                                
                                local created_joker = false
                                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                    created_joker = true
                                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                    G.E_MANAGER:add_event(Event({
                                        func = function()
                                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_morerandom_blank' })
                                            if joker_card then
                                                
                                                
                                            end
                                            G.GAME.joker_buffer = 0
                                            return true
                                        end
                                    }))
                                end
                                if created_joker then
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                                end
                                return true
                            end,
                            colour = G.C.BLUE
                        }
                    }
                }
            }
        end
    end
}