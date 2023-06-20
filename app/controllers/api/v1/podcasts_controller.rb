class Api::V1::PodcastsController < Api::V1::BaseController
  include Pundit::Authorization
  before_action :authenticate_user!

  def create
    puts request.headers['X-User-Token']
  puts request.headers['X-User-Email']
    @podcast = Podcast.new(podcast_params)
    @podcast.user = current_user
    authorize @podcast
    if @podcast.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    puts "X-User-Email: #{request.headers['X-User-Email']}"
    puts "X-User-Token: #{request.headers['X-User-Token']}"

    @podcast = Podcast.find(params[:id])
    authorize @podcast

    if @podcast.update(podcast_params)
      render :show
    else
      render_error
    end
  end

  def show
    @podcast = Podcast.find(params[:id])
    authorize @podcast
    render json: @podcast
  end

  def destroy


    @podcast = Podcast.find(params[:id])
        authorize @podcast


    @podcast.destroy
        head

    :no_content
      end



  private

  def podcast_params
    params.require(:podcast).permit(:title, :description, :episode_number, :duration, :published_at)
  end

  def render_error
    render json: { errors: @podcast.errors.full_messages },
      status: :unprocessable_entity
  end
end
