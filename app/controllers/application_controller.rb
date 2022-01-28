class ApplicationController < ActionController::API
	def set_locale(locale)
		if locale.nil?
	  	  setted_locale = :en
	  	else 
	  	  setted_locale = locale 	
	  	end
	  	return setted_locale		
    end	
    def validate_locale	
	    if !params[:locale].nil? && [:en,:es].include?(params[:locale])
	        return render status: :unprocessable_entity
	    end
    end
end
