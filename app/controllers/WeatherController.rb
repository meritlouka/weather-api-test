class WeatherController < ApplicationController
	before_action :validate_locale

	def temperature
		if params[:degrees].nil?
		  	return render status: :unprocessable_entity
		end

	  	locale = set_locale(params[:locale])	    
	    if params[:degrees] < 0
	      	description =  I18n.t("temperature.below_zero",degrees: params[:degrees].abs,locale: locale)
	    else 
	      	description =  I18n.t("temperature.above_zero",degrees: params[:degrees],locale: locale)
	    end
	    return render json: {description: description} 	
	end	

	def wind
		if params[:wind_speed].nil?
		  return render status: :unprocessable_entity
		end

	  	locale = set_locale(params[:locale])
	    
	    if params[:wind_speed] < 3
	      	description =  I18n.t("wind.none",locale: locale)
	    elsif params[:wind_speed] < 8
	      	description =  I18n.t("wind.weak",locale: locale)
	    elsif params[:wind_speed] < 20
	      	description =  I18n.t("wind.medium",locale: locale)
	    elsif  params[:wind_speed] >= 20
	      	description =  I18n.t("wind.strong",locale: locale)
	    end
	    return render json: {description: description} 	
	end	

	def cloud
       if params[:clouds].nil?
		  	return render status: :unprocessable_entity
		end

	  	locale = set_locale(params[:locale])	    
	    if params[:clouds] <= 10
	      	description =  I18n.t("clouds.none",locale: locale)
	    elsif params[:clouds] <= 70
	      	description =  I18n.t("clouds.partial",locale: locale)
	    elsif params[:clouds] > 70
	      	description =  I18n.t("clouds.full",locale: locale)  	
	    end
	    return render json: {description: description} 	
	end	
end
