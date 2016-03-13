class ExcelsController < ApplicationController
  
  resource_description do
    short 'Api for imorting excel data'
  end
  
  def index
  end
  
  api 'POST', 'excel/import', 'Import excel data'
  
  def import
    
    filename = "uploaded-file"
    in_content_type, encoding, string = params[:file].split(/[:;,]/)[1..3]
    
    extension = File.extname(params[:original_filename])
    
    @tempfile = Tempfile.new([filename, extension])
    @tempfile.binmode
    
    @tempfile.write Base64.decode64(string)
    @tempfile.rewind
    
    filename += extension
    
    params[:new_file] = ActionDispatch::Http::UploadedFile.new({
      tempfile: @tempfile,
      content_type: in_content_type,
      filename: filename,
      original_filename: filename
    })
    
    @data = Excel.import(params[:new_file])
    
    render json: { success: true, message: 'imported successfully', data: @data }, status: 200  
  end

  api 'POST', 'excels/test', 'Just for testing'
  param :data, String, desc: 'some text'
  def test
    data = "aaab #{params[:data]}"    
 
    render json: { success: true, message: 'Tested successfully', data: data }, status: 200
  end
end
