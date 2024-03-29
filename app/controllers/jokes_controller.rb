class JokesController < ApplicationController
  # GET /jokes
  # GET /jokes.json
  def index
    @jokes = Joke.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jokes }
    end
  end

  # GET /jokes/1
  # GET /jokes/1.json
  def show

    @joke = Joke.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @joke }
    end

  end

  def next
    ids = Joke.find(:all).collect{ | j | j.id }
    id = ids[rand(ids.length)]
    redirect_to :action => 'show', :id => id
  end

  # GET /jokes/new
  # GET /jokes/new.json
  def new
    @joke = Joke.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @joke }
    end
  end

  # GET /jokes/1/edit
  def edit
    @joke = Joke.find(params[:id])
  end

  # POST /jokes
  # POST /jokes.json
  def create
    @joke = Joke.new(params[:joke])

    respond_to do |format|
      if @joke.save
        format.html { redirect_to @joke, notice: 'Joke was successfully created.' }
        format.json { render json: @joke, status: :created, location: @joke }
      else
        format.html { render action: "new" }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jokes/1
  # PUT /jokes/1.json
  def update
    @joke = Joke.find(params[:id])

    respond_to do |format|
      if @joke.update_attributes(params[:joke])
        format.html { redirect_to @joke, notice: 'Joke was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jokes/1
  # DELETE /jokes/1.json
  def destroy
    @joke = Joke.find(params[:id])
    @joke.destroy

    respond_to do |format|
      format.html { redirect_to jokes_url }
      format.json { head :no_content }
    end
  end

  def vote
    @joke = Joke.find(params[:id])

    puts params

    redirect_to :action => 'next', :id => params[:id]
  end
end
