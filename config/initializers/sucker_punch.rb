SuckerPunch.config do
  queue name: :carrierwave, worker: CarrierWave::Workers::StoreAsset, size: 2
end
