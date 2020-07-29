AssetSync.configure do |config|
  # Disable automatic run on precompile in order to attach to webpacker rake task
  config.run_on_precompile = false
  # The block should return an array of file paths
  config.add_local_file_paths do
    # Support webpacker assets
    public_root = Rails.root.join("public")
    Dir.chdir(public_root) do
      packs_dir = Webpacker.config.public_output_path.relative_path_from(public_root)
      Dir[File.join(packs_dir, '/**/**')]
    end
  end
end