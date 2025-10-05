<?php

use App\Http\Controllers\Api\Games\GameController;
use App\Http\Controllers\Api\Profile\WalletController;
use App\Models\Game;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/


Route::get('loadinggame', function () {});
Route::get('/withdrawal/{id}', [WalletController::class, 'withdrawalFromModal'])->name('withdrawal');

/*
|--------------------------------------------------------------------------
| Web LIMPAR CACHE
|--------------------------------------------------------------------------
*/


Route::get('/clear', function () {
    // Limpa todas as caches principais
    Artisan::call('config:clear');
    Artisan::call('cache:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    return back()->with('status', 'Cache limpo com sucesso!');
})->name('clear.cache');

Route::get('/update-colors', function () {
    // Executa os mesmos comandos de limpar cache, pois as cores geralmente estão no cache de configuração
    Artisan::call('config:clear');
    Artisan::call('cache:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    return back()->with('status', 'Cores atualizadas com sucesso!');
})->name('update.colors');

Route::get('/clear-memory', function () {
    // Limpa todas as caches e remove arquivos temporários de compilação
    Artisan::call('config:clear');
    Artisan::call('cache:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    return back()->with('status', 'Memória limpa com sucesso!');
})->name('clear.memory');

Route::get('/optimize-system', function () {
    // Executa otimização do sistema
    Artisan::call('optimize');
    return back()->with('status', 'Sistema otimizado com sucesso!');
})->name('optimize.system');


/*
|--------------------------------------------------------------------------
*/


Route::get('/undefined', function (): Factory|View {
    return view('undefined'); // Ou outro nome de sua escolha
});


Route::get('api/middleware/rox', function () {
    return view('middleware'); // Ou outro nome de sua escolha
});



// GAMES PROVIDER

include_once(__DIR__ . '/groups/provider/playFiver.php');
include_once(__DIR__ . '/groups/ControlPainel/calbackmetod.php');

// GATEWAYS
include_once(__DIR__ . '/groups/gateways/bspay.php');
include_once(__DIR__ . '/groups/gateways/stripe.php');
include_once(__DIR__ . '/groups/gateways/ezzepay.php');
include_once(__DIR__ . '/groups/gateways/digitopay.php');

/// SOCIAL
include_once(__DIR__ . '/groups/auth/social.php');

// APP
include_once(__DIR__ . '/groups/layouts/app.php');
