<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Symfony\Component\Process\Process;

class SetupBootstrapJQuery extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'setup:bootstrap-jquery';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Setup Bootstrap and jQuery with NPM';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        // Install NPM packages
        $this->info('Installing NPM packages...');
        $this->runProcess(['npm', 'install']);

        // Install Bootstrap, Popper.js, and jQuery
        $this->info('Installing Bootstrap, Popper.js, and jQuery...');
        $this->runProcess(['npm', 'install', 'bootstrap', '@popperjs/core', 'jquery']);
        $this->runProcess(['npm', 'install', 'sass']);

        // Copy Bootstrap and jQuery files to the public directory
        $this->info('Copying Bootstrap and jQuery files...');
        File::ensureDirectoryExists(public_path('css'));
        File::ensureDirectoryExists(public_path('js'));

        File::copy('node_modules/bootstrap/dist/css/bootstrap.min.css', public_path('css/bootstrap.min.css'));
        File::copy('node_modules/bootstrap/dist/js/bootstrap.bundle.min.js', public_path('js/bootstrap.bundle.min.js'));
        File::copy('node_modules/@popperjs/core/dist/umd/popper.min.js', public_path('js/popper.min.js'));
        File::copy('node_modules/jquery/dist/jquery.min.js', public_path('js/jquery.min.js'));

        // Create blade to incllude in the head file
        $this->info('Creating bootstrap-jquery.blade.php ...');
        File::ensureDirectoryExists(resource_path('view/imports'));

        $bladeContent = <<<'EOT'
<!-- Includes Bootstrap -->
<link rel="stylesheet" href="{{ asset('css/bootstrap.min.css') }}">
<script src="{{ asset('js/popper.min.js') }}" defer></script>
<script src="{{ asset('js/bootstrap.bundle.min.js') }}" defer></script>

<!-- Includes jQuery -->
<script src="{{ asset('js/jquery.min.js') }}"></script>
EOT;

        File::put(resource_path('views/imports/bootstrap-jquery.blade.php'), $bladeContent);

        $this->info('Setup completed successfully!');
        $this->info('Write in your blade between <head>...</head>: @include("imports.bootstrap-jquery")');

        return Command::SUCCESS;
    }

    /**
     * Run a shell command and output its results.
     *
     * @param array $command
     * @return void
     */
    protected function runProcess(array $command)
    {
        $process = new Process($command);
        $process->setTimeout(null);
        $process->run(function ($type, $buffer) {
            echo $buffer;
        });

        if (!$process->isSuccessful()) {
            $this->error('Command failed: ' . implode(' ', $command));
            exit(1);
        }
    }
}
