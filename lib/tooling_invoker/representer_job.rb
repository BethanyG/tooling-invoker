module ToolingInvoker
  class RepresenterJob < Job
    def initialize(id, *args)
      super(id, *args)
    end

    def invocation_args
      ["bin/run.sh", exercise, "/mnt/exercism-iteration/", "/mnt/exercism-iteration/"]
    end

    def output_filepaths
      ["representation.txt", "mapping.json"]
    end

    def working_directory
      "/opt/representer"
    end

    def tool
      "#{language}-representer"
    end
  end
end
