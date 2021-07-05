class VotesController < ApplicationController
  def new
    return redirect_to root_path if Quote.count < 2

    quote_1 = Quote.order('RANDOM()').first
    quote_2 = Quote.where.not(id: quote_1.id).order('RANDOM()').first

    @vote_form_left = VoteForm.new(preferred_quote_id: quote_1.id, other_quote_id: quote_2.id)
    @vote_form_right = VoteForm.new(preferred_quote_id: quote_2.id, other_quote_id: quote_1.id)
  end

  def create
    VoteForm.new(params[:vote]).save

    redirect_to new_vote_path
  end
end
