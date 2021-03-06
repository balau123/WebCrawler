require_relative "News/getNews"

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  @@crawData=[]
  @@category=''
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def posted
  @post = Post.all
  @limit=5
  @limited = 4
  

  end

  def postedinfo
  @id=params[:id].to_i
  puts "ID", @id
  puts "Path" ,postedinfo_path(@id)

  end


  # GET /posts/1/edit
  def edit
  end

  def craw
    @n=GetNews.new()
    @@newArticle      =@n
    @category         =params[:category]
    @pages            =params[:pages]
    @quantity         =params[:quantity].to_i
    
    if @category
      @pages.each{ |p|
      @n.craw(p,@category,@quantity)
      #n.show()
      }
    end

    @@crawData=@n.rss_results

    respond_to do |format|
      format.html {}
      format.js{}
      format.json{render :json =>@@crawData}
    end

  end


  def article
    @id               =params[:id].to_i
    @idArticle        =@@crawData[@id]

    @image            =@idArticle[:img]
    @page             =@idArticle[:page]
    @link             =@idArticle[:link]
    @content          =@idArticle[:content]
    @contentVerbose   =@@newArticle.getContentVerbose(@page, @link)
    @category         =@idArticle[:category]
    @title            =@idArticle[:title]

    @post             = Post.new()
    @post[:title]     = @title
    @post[:category]  = @category
    @post[:page]      = @page
    @post[:image]     = @image        
    @post[:content]   = @content
    @post[:contentVerbose] = @contentVerbose
    @post[:page]      = @page
    @post[:link]      = @link

    #@posts = Post.all

    puts "ID",@id
    render :article, post:@post


  end
  

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   private
  #   # Use callbacks to share common setup or constraints between actions.
     def set_post
       @post = Post.find(params[:id])
     end

     def set_postedinfo
       @post = Post.find(params[:id])
     end

  #   # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:category, :page, :title, :image, :link, :content,:contentVerbose)
    end

    def postedinfo_params
      params.require(:postedinfo).permit(:id)
    end

    def craw_params
      params.require(:craw).permit(:pages,:category,:quantity)
    end

    def article_params
      params.require(:article).permit(:id)
    end


end