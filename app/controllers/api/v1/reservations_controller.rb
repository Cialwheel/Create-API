class Api::V1::ReservationsController < ApiController
  before_action :authenticate_user!, :only => [:index]
  def create
    @train = Train.find_by_number!( params[:train_number] )
    @reservation = Reservation.new( :train_id => @train.id,
                                    :seat_number => params[:seat_number],
                                    :customer_name => params[:customer_name],
                                    :customer_phone => params[:customer_phone] )

    @reservation.user = current_user
    if @reservation.save
      render :json => { :booking_code => @reservation.booking_code,
                        :reservation_url => api_v1_reservation_url(@reservation.booking_code) }
    else
      render :json => { :message => "booking failed", :errors => @reservation.errors }, :status => 400
    end
  end

  def show
    @reservation = Reservation.find_by_booking_code!(params[:booking_code])
  end

  def update
    @reservation = Reservation.find_by_booking_code!(params[:booking_code])
    @reservation.update(:customer_name => params[:customer_name], :customer_phone => params[:customer_phone])
    render :json => {:message => "update success"}
  end

  def destroy
    @reservation = Reservation.find_by_booking_code!(params[:booking_code])
    @reservation.destroy
    render :json => {:message => "cancel success"}
  end

  def index
    @reservations = current_user.reservations
  end

end
