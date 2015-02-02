require 'net/https'
namespace :k3 do
  # Returns Success/failure messages.
  desc 'Install k3 javascript plugins/widgets'
  task :install do
    asset_host = 'raw.githubusercontent.com'
    asset_path = '/TheMadDeveloper/jquery-boilerplate/master/src/jquery.noise.js'

    # based on http://snippets.dzone.com/posts/show/2469
    # http://farm1.static.flickr.com/92/218926700_ecedc5fef7_o.jpg

    http = Net::HTTP.new(asset_host, 443)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this

    resp = http.get(asset_path)
    open("vendor/assets/javascripts/jquery.noise.js", "w") { |file| file.write(resp.body) }


    # if ENV["git"]
    #   manifest = theme_from_git_url(ENV["git"])
    #   name = manifest["name"]
    # else
    #   name = ENV["name"].to_s.downcase
    # end
    #
    #
    # packaged_theme_path = JB::Path.build(:theme_packages, :node => name)
    #
    # abort("rake aborted!
    #   => ERROR: 'name' cannot be blank") if name.empty?
    # abort("rake aborted!
    #   => ERROR: '#{packaged_theme_path}' directory not found.
    #   => Installable themes can be added via git. You can find some here: http://github.com/jekyllbootstrap
    #   => To download+install run: `rake theme:install git='[PUBLIC-CLONE-URL]'`
    #   => example : rake theme:install git='git@github.com:jekyllbootstrap/theme-the-program.git'
    # ") unless FileTest.directory?(packaged_theme_path)
    #
    # manifest = verify_manifest(packaged_theme_path)
    #
    # # Get relative paths to packaged theme files
    # # Exclude directories as they'll be recursively created. Exclude meta-data files.
    # packaged_theme_files = []
    # FileUtils.cd(packaged_theme_path) {
    #   Dir.glob("**/*.*") { |f|
    #     next if ( FileTest.directory?(f) || f =~ /^(manifest|readme|packager)/i )
    #     packaged_theme_files << f
    #   }
    # }
    #
    # # Mirror each file into the framework making sure to prompt if already exists.
    # packaged_theme_files.each do |filename|
    #   file_install_path = File.join(JB::Path.base, filename)
    #   if File.exist? file_install_path
    #     next if ask("#{file_install_path} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
    #   else
    #     mkdir_p File.dirname(file_install_path)
    #     cp_r File.join(packaged_theme_path, filename), file_install_path
    #   end
    # end
    #
    # puts "=> #{name} theme has been installed!"
    # puts "=> ---"
    # if ask("=> Want to switch themes now?", ['y', 'n']) == 'y'
    #   system("rake switch_theme name='#{name}'")
    # end
  end
end

# Internal: Download and process a theme from a git url.
# Notice we don't know the name of the theme until we look it up in the manifest.
# So we'll have to change the folder name once we get the name.
#
# url - String, Required url to git repository.
#
# Returns theme manifest hash
# def theme_from_git_url(url)
#   tmp_path = JB::Path.build(:theme_packages, :node => "_tmp")
#   abort("rake aborted: system call to git clone failed") if !system("git clone #{url} #{tmp_path}")
#   manifest = verify_manifest(tmp_path)
#   new_path = JB::Path.build(:theme_packages, :node => manifest["name"])
#   if File.exist?(new_path) && ask("=> #{new_path} theme package already exists. Override?", ['y', 'n']) == 'n'
#     remove_dir(tmp_path)
#     abort("rake aborted: '#{manifest["name"]}' already exists as theme package.")
#   end
#
#   remove_dir(new_path) if File.exist?(new_path)
#   mv(tmp_path, new_path)
#   manifest
# end
