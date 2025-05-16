SMODS.Joker { --penrose
  key = 'penrose',
  
  rarity = 3,
  atlas = 'T.Jokers',
  pos = { x = 0, y = 1 },
  cost = 10,
  perishable_compat = true,
  blueprint_compat = false,
  eternal_compat = true,
  calculate = function(self, card, context)
    if context.after then
      if #G.play.cards ~= 3 then return nil, false end
      local threes = {}
      for _, card in pairs(G.play.cards) do
        if card:get_id() == 3 then
          threes[#threes + 1] = card
        end
      end
      if #threes == 1 then
        G.E_MANAGER:add_event(Event({
          func = function() 
            for _, card in pairs(G.play.cards) do
              if card ~= threes[1] then
                copy_card(threes[1], card)
              end
            end
            return true
          end
        }))
      end
      return nil, true
    end
  end
}
