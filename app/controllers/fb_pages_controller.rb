class FbPagesController < ApplicationController
  before_action :set_fb_page, only: [:show, :edit, :update, :destroy]

  # GET /fb_pages
  # GET /fb_pages.json
  def index
    @fb_pages = FbPage.all
  end

  def snapshot
    Facebook.take_fb_page_snapshot(params[:id])
    respond_to do |format|
        format.html { render :text => "done" }
    end
  end

  # GET /fb_pages/1
  # GET /fb_pages/1.json
  def show
  end

  # GET /fb_pages/new
  def new
    @fb_page = FbPage.new
  end

  # GET /fb_pages/1/edit
  def edit
  end

  # POST /fb_pages
  # POST /fb_pages.json
  def create
    @fb_page = FbPage.new(fb_page_params)

    respond_to do |format|
      if @fb_page.save
        format.html { redirect_to @fb_page, notice: 'Fb page was successfully created.' }
        format.json { render :show, status: :created, location: @fb_page }
      else
        format.html { render :new }
        format.json { render json: @fb_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fb_pages/1
  # PATCH/PUT /fb_pages/1.json
  def update
    respond_to do |format|
      if @fb_page.update(fb_page_params)
        format.html { redirect_to @fb_page, notice: 'Fb page was successfully updated.' }
        format.json { render :show, status: :ok, location: @fb_page }
      else
        format.html { render :edit }
        format.json { render json: @fb_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fb_pages/1
  # DELETE /fb_pages/1.json
  def destroy
    @fb_page.destroy
    respond_to do |format|
      format.html { redirect_to fb_pages_url, notice: 'Fb page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fb_page
      @fb_page = FbPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fb_page_params
      params.require(:fb_page).permit(:page_id, :page_name)
    end
end
