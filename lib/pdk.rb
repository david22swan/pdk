require 'pdk/i18n'

module PDK
  autoload :Analytics, 'pdk/analytics'
  autoload :AnswerFile, 'pdk/answer_file'
  autoload :Config, 'pdk/config'
  autoload :Generate, 'pdk/generate'
  autoload :Logger, 'pdk/logger'
  autoload :Module, 'pdk/module'
  autoload :Report, 'pdk/report'
  autoload :TemplateFile, 'pdk/template_file'
  autoload :TEMPLATE_REF, 'pdk/version'
  autoload :Util, 'pdk/util'
  autoload :Validate, 'pdk/validate'
  autoload :VERSION, 'pdk/version'

  # TODO - Refactor backend code to not raise CLI errors or use CLI util
  #        methods.
  module CLI
    autoload :ExitWithError, 'pdk/cli/errors'
    autoload :FatalError, 'pdk/cli/errors'
    autoload :Util, 'pdk/cli/util'
    autoload :Exec, 'pdk/cli/exec'
    autoload :ExecGroup, 'pdk/cli/exec_group'
  end

  module Test
    autoload :Unit, 'pdk/tests/unit'
  end

  # Singleton accessor to the current answer file being used by the PDK.
  #
  # @return [PDK::AnswerFile] The AnswerFile instance currently being used by
  #   the PDK.
  def self.answers
    @answer_file ||= PDK::AnswerFile.new
  end

  # Specify the path to a custom answer file that the PDK should use.
  #
  # @param path [String] A path on disk to the file where the PDK should store
  #   answers to interactive questions.
  def self.answer_file=(path)
    @answer_file = PDK::AnswerFile.new(path)
  end

  def self.logger
    @logger ||= PDK::Logger.new
  end

  def self.config
    @config ||= PDK::Config.new
  end
end
