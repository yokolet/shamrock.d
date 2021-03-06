class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all.sort {|x, y| x.no <=> y.no}

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.get(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    attrs = params[:page]
    no = attrs["no"]
    if no.is_a?(String) && /\d+/ =~ no
      attrs["no"] = no.to_i
    end
    puts "ATTRS: #{attrs}"
    @page = Page.new(attrs)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    puts "UPDATE"
    @page = Page.get(params[:id])

    respond_to do |format|
    attrs = params[:page]
    no = attrs["no"]
    if no.is_a?(String) && /\d+/ =~ no
      attrs["no"] = no.to_i
    end
    puts "UPDATES ATTRS: #{attrs}"
      if @page.update(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.get(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end
