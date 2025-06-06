SMODS.Joker { --pie
  key = 'pie',
  pools = { Food = true },
  rarity = 1,
  cost = 6,
  atlas = "T.Jokers",
  pos = { x = 0, y = 2 },
  eternal_compat = false,
  perishable_compat = true,
  blueprint_compat = true,
  config = { extra =  { mult = 24, mult_mod = 6 } },
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
  end,
  calculate = function (self, card, context)
    if context.joker_main then
        return {
            mult = card.ability.extra.mult,
        }
    end
    if context.end_of_round and not context.repetition and not context.individual and not context.blueprint and G.GAME.current_round.hands_played > 1 then
        card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.mult_mod
        if card.ability.extra.mult <= 0 then
          G.E_MANAGER:add_event(Event({
            func = function()
            play_sound('tarot1')
            card.T.r = -0.2
            card:juice_up(0.3, 0.4)
            card.states.drag.is = true
            card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
          func = function()
            G.jokers:remove_card(card)
                card:remove()
                card = nil
                return true
          end
            }))
            return true
          end
        }))
        return {
          message = localize('k_eaten_ex'),
          colour = G.C.RED,
        }
      else
        return {
          message = localize{type='variable',key='a_mult_minus',vars={card.ability.extra.mult_mod}},
          colour = G.C.MULT,
        }
      end
    end
  end
}