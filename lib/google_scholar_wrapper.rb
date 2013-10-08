require 'csv'

class GScholar

  SCHOLAR_SCRIPT_PATH = "#{Rails.root}/lib/scholar.py"

  def self.search(q)
    raw_data = %x(python #{SCHOLAR_SCRIPT_PATH} --csv  #{q} )
    csv_result_hash = process_csv_result(raw_data)
    return csv_result_hash
  end

  def self.process_csv_result(raw_data)
    result = []

    CSV.parse(raw_data, { :col_sep => "\|"}) do |row|
      paper = { :title => row[0], :url => row[1], :num_citation => row[2], :num_versions => row[3],
                :url_citation => row[4], :url_version => row[5], :year => row[6]}
      result << paper
    end

    return result
  end

end
