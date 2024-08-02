# config/initializers/rack_attack.rb
class Rack::Attack
  # Permitir tráfego local
  safelist('allow-localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  # Bloquear tráfego de um IP específico
  blocklist('block-bad-ips') do |req|
    bad_ips = ['1.2.3.4', '5.6.7.8']
    bad_ips.include?(req.ip)
  end

  # Limitar solicitações a 5 por segundo por IP
  throttle('req/ip', limit: 5, period: 1.second) do |req|
    req.ip
  end

  # Limitar tentativas de login a 5 por 20 minutos por IP
  throttle('logins/ip', limit: 5, period: 20.minutes) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.ip
    end
  end

  # Limitar tentativas de login a 5 por 20 minutos por conta de e-mail
  throttle('logins/email', limit: 5, period: 20.minutes) do |req|
    if req.path == '/users/sign_in' && req.post?
      req.params['user']['email'].presence
    end
  end

  # Bloquear solicitações de IPs suspeitos por 5 minutos após 5 solicitações falhas
  self.blocklisted_response = lambda do |env|
    [503, {}, ["Your IP has been blocked.\n"]]
  end

  # Log de bloqueios para ajudar na monitoração
  ActiveSupport::Notifications.subscribe('rack.attack') do |name, start, finish, request_id, payload|
    req = payload[:request]
    Rails.logger.info "Rack::Attack: #{req.path} blocked for #{req.ip}"
  end
end

